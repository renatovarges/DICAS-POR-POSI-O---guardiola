@echo off
echo ==============================================
echo       Iniciando VIP Guardiola (Local)
echo ==============================================

cd /d "%~dp0"

:: 1. Verificar se o Python existe no computador
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo [ERRO] Python nao encontrado neste computador!
    echo Por favor, instale o Python baixando do site oficial e lembre de marcar a caixa "Add Python to PATH" na hora de instalar.
    pause
    exit /b
)

:: 2. Instalar dependencias ou recriar o ambiente pro PC novo do amigo
IF NOT EXIST ".venv\Scripts\python.exe" (
    echo [INFO] Configurando o ambiente na maquina na primeira vez...
    python -m venv .venv
)

echo [INFO] Instalando bibliotecas necessarias...
.venv\Scripts\python.exe -m pip install -q -r requirements.txt

:: 3. Rodar o App com a versao correta de dentro da pasta
echo [OK] Tudo pronto! Abrindo o painel na internet local...
.venv\Scripts\python.exe -m streamlit run app.py

pause
