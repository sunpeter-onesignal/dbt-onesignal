select 
    cast(id as varchar) as id, 
    cast(app_id as varchar) as app_id, 
    contents,
    send_after as ds,
    sms_from,
    sms_media_urls, 
    created_source 
from hive.public.notifications 
where issms=true