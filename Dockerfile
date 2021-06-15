# syntax=docker/dockerfile:1
FROM julia:1.6.1
WORKDIR /app
RUN apt-get update && apt-get install -y \
  build-essential \
  git
COPY Project.toml .
RUN julia --project=. -e "using Pkg; Pkg.instantiate()"
COPY startup.jl /root/.julia/config/startup.jl
CMD ["julia", "--project=."]
