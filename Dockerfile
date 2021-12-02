FROM bitnami/python:3.9-prod

ARG PYPI_VERSION

RUN until pip install --no-cache-dir "prometheus_ecs_discoverer==${PYPI_VERSION}"; do sleep 15; done

COPY prometheus_ecs_discoverer/*.py /opt/bitnami/python/lib/python3.9/site-packages/prometheus_ecs_discoverer/

CMD [ "python", "-m", "prometheus_ecs_discoverer.main" ]