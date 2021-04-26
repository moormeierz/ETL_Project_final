SELECT public.economic_csv.country_name , public.economic_csv.unemployment, public.happiness_csv.happy_score
FROM public.economic_csv
INNER JOIN public.happiness_csv 
ON public.economic_csv.country_name=public.happiness_csv.country_name
WHERE public.economic_csv.country_name = 'Albania' ;


