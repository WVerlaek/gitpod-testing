FROM amd64/ubuntu:latest

# Fail image build.
RUN this-cmd-does-not-exist
