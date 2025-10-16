alias l='-l'
alias ls='lsd'
alias la='ls -a'
alias lla='ls -la'


alias fd='fdfind'

alias sudo-shell='sudo -E zsh'

# [Development]
if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null; then
  alias wezterm='/mnt/c/Users/DaveanandMannie/scoop/apps/wezterm/current/wezterm.exe'
else
  alias wezterm='wezterm'  # Or point to native binary if needed
fi
# [Odoo]
alias erp-dev='cd ~/workspace/pg/erp/'
alias erp-dev-server='erp-dev && source venvs/odoo18/bin/activate && cd odoo && python3 odoo-bin -c ../odoo.conf --dev all'
alias erp-dev-test='cd ~/workspace/pg/erp && source venvs/odoo18/bin/activate && cd odoo && python3 odoo-bin -c ../test.conf -i accounting_td_edi,anb_img_zip_importation,auto_raw_procure,client_sku_mapping,contact_anonymization,invoice_line_grouper,pgk_dashboard,pgk_purchase,purchase_order_cost_approval,pricing_breakdown,stock_picking_batch_simple,roq_integration && dropdb --if-exists testdb'
# [portal]
alias erp-portal-server='erp-dev && source venvs/odoo17/bin/activate && cd odoo && python3 odoo-bin -c ../.portalrc --dev all'
alias portal-dev='cd ~/workspace/pg/portal/'

alias lg='lazygit'
