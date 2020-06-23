FROM crystallang/crystal:0.33.0-alpine

ENV WSP_ROOT /app
ENV KEMAL_ENV production
WORKDIR $WSP_ROOT
ADD db/ $WSP_ROOT/db
ADD lib/ $WSP_ROOT/lib
ADD src/ $WSP_ROOT/src
RUN crystal build $WSP_ROOT/src/main.cr --release --static
EXPOSE 3000
CMD ["/app/main"]
