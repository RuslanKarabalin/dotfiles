# dotfiles

## HTTP, gRPC, SOAP with curl

### Basics

```sh
# GET with query and header
curl -sS 'https://httpbin.org/get?page=1' -H 'Accept: application/json'

# Other methods
curl -sS -X PUT https://httpbin.org/put -d x=1
curl -sS -X DELETE https://httpbin.org/delete
```

Flags used everywhere:

| Flag | Meaning |
| --- | --- |
| `-sS` | No progress bar, but still show errors |
| `-H` | Add a header |
| `-d` | Request body, switches the method to POST |
| `-X` | Set the method explicitly |
| `-i` | Print response headers together with the body |
| `-I` | Headers only (HEAD request) |
| `-v` | Full request and response trace, with TLS |
| `-L` | Follow redirects |
| `-o /dev/null` | Drop the body |

### JSON

```sh
# --json sets Content-Type and Accept to application/json
curl -sS https://httpbin.org/post --json '{"amount":100,"currency":"RUB"}'

# Body from a file
curl -sS https://httpbin.org/post --json @body.json

# Pretty print and pick a field
curl -sS https://httpbin.org/get | jq .headers
```

### Forms and files

```sh
# application/x-www-form-urlencoded
curl -sS https://httpbin.org/post -d user=ruslan -d role=dev

# multipart/form-data
curl -sS https://httpbin.org/post -F file=@body.json -F comment=hi
```

### Auth and cookies

```sh
curl -sS https://httpbin.org/bearer -H 'Authorization: Bearer token123'
curl -sS -u user:pass https://httpbin.org/basic-auth/user/pass

# Save cookies, then send them back
curl -sS -c cookies.txt https://httpbin.org/cookies/set/session/abc
curl -sS -b cookies.txt https://httpbin.org/cookies
```

### Debugging

```sh
# Status code only
curl -sS -o /dev/null -w '%{http_code}\n' https://httpbin.org/get

# Where the time goes
curl -sS -o /dev/null https://httpbin.org/get -w \
  'dns=%{time_namelookup} connect=%{time_connect} '\
'tls=%{time_appconnect} ttfb=%{time_starttransfer} total=%{time_total}\n'

# Exit code 22 on 4xx and 5xx, body is still printed
curl -sS --fail-with-body https://httpbin.org/status/404

# Timeouts and retries for scripts
curl -sS --connect-timeout 3 --max-time 10 --retry 2 https://httpbin.org/get
```

### GraphQL

GraphQL is a POST with JSON: `query` plus optional `variables`.

```sh
curl -sS https://countries.trevorblades.com/ --json '{
  "query": "query($c: ID!) { country(code: $c) { name capital } }",
  "variables": { "c": "RS" }
}'
```

### SOAP

SOAP is a POST with an XML envelope. Versions differ in headers and namespace.

SOAP 1.1:

```sh
curl -sS https://www.dataaccess.com/webservicesserver/NumberConversion.wso \
  -H 'Content-Type: text/xml; charset=utf-8' \
  -H 'SOAPAction: ""' \
  -d '<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
      <ubiNum>42</ubiNum>
    </NumberToWords>
  </soap:Body>
</soap:Envelope>' | xmllint --format -
```

SOAP 1.2: no `SOAPAction` header, different `Content-Type` and namespace.

```sh
curl -sS https://www.dataaccess.com/webservicesserver/NumberConversion.wso \
  -H 'Content-Type: application/soap+xml; charset=utf-8' \
  -d @request.xml | xmllint --format -
```

Envelope for 1.2 starts with
`<soap12:Envelope xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">`.

The service description (WSDL) is usually available at `?WSDL`:

```sh
curl -sS 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso?WSDL'
```

If the server expects a specific action, put it in `SOAPAction` (1.1) or
in `Content-Type` as `action="..."` (1.2). Values are listed in the WSDL.

### gRPC

curl cannot speak gRPC: it uses binary protobuf framing over HTTP/2.
Use `grpcurl`, it takes the same JSON and `-H` flags.

```sh
# Explore a server with reflection
grpcurl grpcb.in:9001 list
grpcurl grpcb.in:9001 describe hello.HelloService

# Call a method (TLS by default)
grpcurl -d '{"greeting":"ruslan"}' \
  grpcb.in:9001 hello.HelloService/SayHello

# No TLS, typical for localhost
grpcurl -plaintext -d '{"greeting":"ruslan"}' \
  grpcb.in:9000 hello.HelloService/SayHello

# Server without reflection: pass the .proto, plus metadata
grpcurl -import-path ./proto -proto hello.proto \
  -H 'authorization: Bearer token123' \
  -d '{"greeting":"ruslan"}' \
  grpcb.in:9001 hello.HelloService/SayHello

# Body from stdin
echo '{"greeting":"ruslan"}' | grpcurl -d @ \
  grpcb.in:9001 hello.HelloService/SayHello
```

For interactive exploration with autocomplete:
`evans -r --host localhost -p 50051 repl`.

### Local stack over HTTP

Start with `docker compose -f ~/.config/devstack/compose.yaml up -d`.

ClickHouse has an HTTP interface on port 8123:

```sh
curl -sS -u default:clickhouse http://localhost:8123/ \
  --data-binary 'SELECT version() FORMAT JSONEachRow'

# Query parameters instead of string concatenation
curl -sS -u default:clickhouse 'http://localhost:8123/?param_n=5' \
  --data-binary 'SELECT number FROM numbers({n:UInt8}) FORMAT CSV'
```

RabbitMQ management API on port 15672. `%2F` is the default vhost `/`:

```sh
# Create a queue
curl -sS -u guest:guest -X PUT localhost:15672/api/queues/%2F/demo \
  --json '{"durable":true}'

# Publish through the default exchange
curl -sS -u guest:guest \
  localhost:15672/api/exchanges/%2F/amq.default/publish --json '{
  "routing_key": "demo", "payload": "{\"id\":1}",
  "payload_encoding": "string", "properties": {}
}'

# Take one message
curl -sS -u guest:guest localhost:15672/api/queues/%2F/demo/get \
  --json '{"count":1,"ackmode":"ack_requeue_false","encoding":"auto"}'
```
