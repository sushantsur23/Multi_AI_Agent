# 5. Create project structure
echo "📂 Setting up project structure..."
mkdir -p app/
mkdir -p app/backend
mkdir -p app/frontend 
mkdir -p app/common
mkdir -p app/core
mkdir -p app/config
touch app/__init__.py
touch app/main.py 

touch .env
touch app/common/__init__.py
touch app/common/logger.py
touch app/common/custom_exception.py

touch app/backend/__init__.py
touch app/frontend/__init__.py
touch app/core/__init__.py
touch app/config/__init__.py

# 4. Create requirements.txt if not exists & add libraries
if [ ! -f "requirements.txt" ]; then
    echo "📄 Creating requirements.txt..."
    cat <<EOL > requirements.txt
streamlit
langchain
langchain-groq
langchain-community
uvicorn
langgraph
python-dotenv
pydantic
fastapi
EOL
    echo "✅ requirements.txt created with default libraries."
else
    echo "📄 requirements.txt already exists, skipping creation."
fi

set -e  # Exit if any command fails

echo "🚀 Initializing Finance Health Report project with Conda..."
conda create --prefix ./venv python=3.11 -y

# 1. Create Conda environment in local folder (./venv)
if [ ! -d "venv" ]; then
    echo "📦 Creating Conda environment in ./venv ..."
    conda create --prefix ./venv python=3.12 -y
else
    echo "✅ Conda environment already exists in ./venv"
fi

# 2. Activate Conda environment
echo "🔗 Activating Conda environment..."
# Conda environments created with --prefix are activated like this:
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate ./venv

echo "🚀 Creating setup.py file with the Project information as needed..."
touch setup.py

# Create setup.py
echo "📝 Creating setup.py..."
cat > setup.py <<EOL
from setuptools import setup, find_packages

setup(
    name="Multi_ai_agent",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        "streamlit",
        "langchain",
        "langchain-groq",
        "langgraph",
        "python-dotenv",
        "pypdf"
        "streamlit",
        "langchain-community",
        "uvicorn",
        "pydantic",
        "fastapi",
    ],
    
    },
    author="Sushant",
    description="Multi Ai Agent using LLMs and LangGraph",
    python_requires=">=3.12",
)
EOL

echo "✅ Setup complete and ready to run! 

echo "✅ Project structure is ready."

echo "⚙️  Installing project in editable mode..."
pip install -e .

#Run the file using the command as ./init.sh in gitbash terminal
