FROM rust:1.46.0-alpine3.12 as builder
WORKDIR /usr/src/parrot-rs
COPY . .
RUN cargo install --path .

FROM scratch 
COPY --from=builder /usr/local/cargo/bin/parrot-rs /usr/local/bin/parrot-rs
CMD ["parrot-rs"]
