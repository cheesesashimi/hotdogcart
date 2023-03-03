FROM rust:alpine AS builder
WORKDIR /src
COPY . /src
RUN cargo build --release

FROM scratch AS final
COPY --from=builder /src/target/release/hotdogcart /hotdogcart
ENTRYPOINT ["/hotdogcart"]
