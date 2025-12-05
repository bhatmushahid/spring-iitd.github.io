1. Create a python virtual environment in the cwd using and enable it.

```bash
python3 -m venv venv
source venv/bin/activate
```

2. Install the mkdocs package:

```bash
pip install mkdocs mkdocs-material
```

3. Navigate to the `docs` directory, and build the website.

```bash
cd docs
mkdocs build
```

4. Check the document before publishing

```bash
mkdocs serve -a 0.0.0.0:8001
```

5. You should have access to the spring.iitd.ac.in or ask someone who has access to upload your documents.
