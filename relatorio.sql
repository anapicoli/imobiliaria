use imovel;

# 1. quantidade de imóveis por estado:
select 
    e.nm_estado, 
    count(i.cd_imovel) as quantidade_imoveis
from 
    estado e
left join 
    imovel i on e.sg_estado = i.sg_estado
group by 
    e.nm_estado;
    
# 2. ofertas por mês:	
select 
    date_format(o.dt_oferta, '%m') as mes,
    count(o.cd_oferta) as quantidade_ofertas
from 
    oferta o
group by 
    mes
order by 
    mes;
    
# 3. comissão por vendedor:
select 
    v.nm_vendedor, 
    sum(o.vl_oferta * 0.05) as comissao
from 
    vendedor v
join 
    imovel i on v.cd_vendedor = i.cd_vendedor
join 
    oferta o on i.cd_imovel = o.cd_imovel
group by 
    v.nm_vendedor;
    
# 4. gasto por comprador:
select 
    c.nm_comprador, 
    sum(o.vl_oferta) as gasto_total
from 
    compradores c
join 
    oferta o on c.cd_comprador = o.cd_comprador
group by 
    c.nm_comprador;

# 5. média de valor de imóvel por estado e cidade:
select 
    e.nm_estado, 
    c.nm_cidade, 
    avg(i.vl_preco) as media_valor_imovel
from 
    estado e
join 
    cidade c on e.sg_estado = c.sg_estado
join 
    imovel i on c.cd_cidade = i.cd_cidade
group by 
    e.nm_estado, c.nm_cidade;