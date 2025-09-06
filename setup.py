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
