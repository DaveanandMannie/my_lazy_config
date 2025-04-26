alias l='-l'
alias ls='lsd'
alias la='ls -a'
alias lla='ls -la'


alias fd='fdfind'

alias sudo-shell='sudo -E zsh'

# [Development]
# [Odoo]
alias erp-dev='cd ~/workspace/pg/erp/ && source venvs/odoo17/bin/activate'
alias erp-dev-server='erp-dev && cd odoo && python3 odoo-bin -c ../.odoorc --dev all'

# [portal]
alias erp-portal-server='erp-dev && cd odoo && python3 odoo-bin -c ../.portalrc --dev all'
