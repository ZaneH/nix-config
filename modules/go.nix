{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    go
    gopls
    delve
    protobuf
    buf
    protoc-gen-go-grpc
    protoc-gen-go
    grpc-gateway
  ];
}
