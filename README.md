# ft_transcendence

* Cloning repo with git hooks
```command
git clone https://github.com/fortytwobytes/ft_transcendence &&\
cd ft_transcendence &&\
python3 -m venv venv &&\
source venv/bin/activate &&\
venv/bin/pip3 install --upgrade pip &&\
venv/bin/pip3 install -r requirements.txt &&\
venv/bin/pre-commit install &&\
venv/bin/pre-commit run --all-files
```

* Code Structure
```
transcendence/
├── backend/
│   ├── Dockerfile
│   ├── manage.py
│   ├── requirements.txt
│   ├── transcendence/
│   │   ├── __init__.py
│   │   ├── settings.py
│   │   ├── urls.py
│   │   └── wsgi.py
│   ├── authentication/ (app)
│   ├── game/ (app)
│   └── chat/ (app)
└── frontend/
    ├── Dockerfile
    ├── package.json
    ├── public/
    │   └── index.html
    ├── src/
    │   ├── App.js
    │   ├── index.js
    │   ├── authentication/
    │   │   ├── Auth.js
    │   │   └── Auth.css
    │   ├── game/
    │   │   ├── Game.js
    │   │   └── Game.css
    │   └── chat/
    │       ├── Chat.js
    │       └── Chat.css
    └── tests/
        ├── App.test.js
        ├── authentication/
        │   └── Auth.test.js
        ├── game/
        │   └── Game.test.js
        └── chat/
            └── Chat.test.js
```
