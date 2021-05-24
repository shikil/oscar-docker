# syntax=docker/dockerfile:1
FROM julia:1.6.1
WORKDIR /app
RUN apt-get update && apt-get install -y \
  build-essential \
  git
COPY *.toml .
RUN julia --project=. -e "using Pkg; Pkg.instantiate()"
CMD ["julia", "--project=."]
