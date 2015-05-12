package  com.ly.fund.service;

import com.ly.fund.vo.Datum;
import org.nutz.dao.Condition;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.service.IdEntityService;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import org.nutz.dao.Cnd;
import com.ly.comm.Page;

import java.util.List;


@IocBean(fields = { "dao" })
public class DatumService extends IdEntityService<Datum> {

	public static String CACHE_NAME = "datum";
    public static String CACHE_COUNT_KEY = "datum_count";

    public List<Datum> queryCache(Condition c,Page p)
    {
        List<Datum> list_datum = null;
        String cacheKey = "datum_list_" + p.getPageCurrent();

        Cache cache = CacheManager.getInstance().getCache(CACHE_NAME);
        if(cache.get(cacheKey) == null)
        {
            list_datum = this.query(c, p);
            cache.put(new Element(cacheKey, list_datum));
        }else{
            list_datum = (List<Datum>)cache.get(cacheKey).getObjectValue();
        }
        return list_datum;
    }

    public int listCount(Condition c)
    {
        Long num = 0L;
        Cache cache = CacheManager.getInstance().getCache(CACHE_NAME);
        if(cache.get(CACHE_COUNT_KEY) == null)
        {
            num = Long.valueOf(this.count(c));
            cache.put(new Element(CACHE_COUNT_KEY, num));
        }else{
            num = (Long)cache.get(CACHE_COUNT_KEY).getObjectValue();
        }
        return num.intValue();
    }



}


