#!/usr/bin/zsh

HOME='/home/queensferry/NcovReport'

cd $HOME
source venv/bin/activate
source .env
python main.py

echo `date` 'Cron has successfully report ncov status!'

