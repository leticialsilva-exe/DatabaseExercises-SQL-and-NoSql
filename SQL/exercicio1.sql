select actor_id, first_name, last_name
from actor
where first_name like 'A%'
order by first_name;

 -- Faça uma consulta que retorne a lista de filmes e suas categorias correspondentes. 
select f.title, c.name
from film f
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id;

-- - Faça uma consulta que retorne a lista de todos os atores com o número filmes que 
-- cada ator participou. Ordene a lista pelo numero de filmes, iniciando pelos atores que mais atuaram. 
select a.actor_id, a.first_name, a.last_name, count(f.film_id) as num_filmes
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
group by a.actor_id
order by num_filmes desc;

--  - Faça uma consulta que retorne a lista de atores que atuaram em filmes com mais de duas horas 
-- de duração (120min). Ordene a lista pelo numero de filmes que cada ator participou.
select a.actor_id, a.first_name, a.last_name, count(f.film_id) as num_filmes
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
where f.length > 120
group by a.actor_id
order by num_filmes desc;

--  Exercício 2: Crie uma consulta para cada consulta do exercício anterior que retorne 
-- o numero de registros encontrados pela busca
  SELECT COUNT(*) FROM (
    SELECT a.actor_id, a.first_name, a.last_name, count(f.film_id) as num_filmes
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    JOIN film f ON fa.film_id = f.film_id
    GROUP BY a.actor_id
  ) AS subquery;

  SELECT COUNT(*) FROM (
    SELECT a.actor_id, a.first_name, a.last_name, count(f.film_id) as num_filmes
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    JOIN film f ON fa.film_id = f.film_id
    WHERE f.length > 120
    GROUP BY a.actor_id
  ) AS subquery;
