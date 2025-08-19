# ONBUILD trap

Why: ONBUILD executes only when another Dockerfile does FROM your image — confusing behavior that often surprises maintainers.

Build and tag the base:
DOCKER_BUILDKIT=1 docker build -f base.Dockerfile -t wc-onbuild-base:demo .

Now build child:
DOCKER_BUILDKIT=1 docker build -f child.Dockerfile -t wc-onbuild-child:demo .

ONBUILD content only executes during the child build. This can surprise users because base image looks inert until used as a parent.

__Pitfall :__ 
- ONBUILD is hard to debug and often causes unexpected behavior — prefer explicit COPY in children.

__Interview callout :__  
- Explain where ONBUILD is useful (language base images for framework scaffolding) and why it’s dangerous.
