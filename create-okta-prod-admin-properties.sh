cp okta_eks_role.properties okta_prod_admin_role.properties
sed -i -e "s~OktaEKSRole~OktaProdAdminRole~" okta_prod_admin_role.properties