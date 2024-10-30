-- Solution using Left, Right, Inner JOIN and UNION operator

SELECT s.id, 'Mismatch' AS Comment

FROM source s

JOIN target t ON s.id = t.id AND s.name <> t.name

	UNION

SELECT s.id, 'New in source' AS Comment

FROM source s

LEFT JOIN target t ON s.id = t.id

WHERE t.id IS NULL

	UNION

SELECT t.id, 'New in target' AS Comment

FROM source s

RIGHT JOIN target t ON s.id = t.id

WHERE s.id IS NULL;

— Solution using FULL OUTER JOIN

select 

case when t.id is null then s.id

	 when s.id is null then t.id

	 when (s.id=t.id and s.name <> t.name) then s.id

end as id

,case when t.id is null then 'New in source'

	 when s.id is null then 'New in target'

	 when (s.id=t.id and s.name <> t.name) then 'Mismatch'

 end as id

from source s

full join target t on t.id=s.id

where t.id is null

or s.id is null

or (s.id=t.id and s.name <> t.name)
