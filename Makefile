# Variables
VENV_DIR := venv
VENV_ACTIVATE := $(VENV_DIR)/bin/activate
PYTHON := $(VENV_DIR)/bin/python
PIP := $(PYTHON) -m pip
BACKEND_DIR := srcs/backend
DJANGO_MANAGE := $(PYTHON) $(BACKEND_DIR)/manage.py
SETTINGS := transcendence.settings

# Create virtual environment if not exists
$(VENV_DIR):
	python3 -m venv $(VENV_DIR)

# Install project dependencies
install: $(VENV_DIR)
	. $(VENV_ACTIVATE) && \
	$(PIP) install -r $(BACKEND_DIR)/requirements.txt

# Run migrations
migrate: $(VENV_DIR)
	. $(VENV_ACTIVATE) && \
	$(DJANGO_MANAGE) migrate --settings=$(SETTINGS)

# Start development server
runserver: $(VENV_DIR)
	. $(VENV_ACTIVATE) && \
	$(DJANGO_MANAGE) runserver --settings=$(SETTINGS)

# Create a superuser
createsuperuser: $(VENV_DIR)
	. $(VENV_ACTIVATE) && \
	$(DJANGO_MANAGE) createsuperuser --settings=$(SETTINGS)

# Run tests
test: $(VENV_DIR)
	. $(VENV_ACTIVATE) && \
	$(DJANGO_MANAGE) test --settings=$(SETTINGS)

# Collect static files
collectstatic: $(VENV_DIR)
	. $(VENV_ACTIVATE) && \
	$(DJANGO_MANAGE) collectstatic --settings=$(SETTINGS)

# Clean pycache
clean:
	find . -name "*.pyc" -exec rm -rf {} \; 2> /dev/null || true
	find . -name "*__pycache__" -exec rm -rf {} \; 2> /dev/null || true
	find . -type d -name "*mypy_cache" -exec rm -rf {} \; 2> /dev/null || true

# Help target
help:
	@echo "Available targets:"
	@echo "  install          - Install project dependencies"
	@echo "  migrate          - Run database migrations"
	@echo "  runserver        - Start development server"
	@echo "  createsuperuser  - Create a superuser"
	@echo "  test             - Run tests"
	@echo "  collectstatic    - Collect static files"
	@echo "  clean            - Clean pycache"
	@echo "  help             - Show this help message"

# Phony targets
.PHONY: install migrate runserver createsuperuser test collectstatic clean help
