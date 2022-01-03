using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

public class PageList<T> : List<T>
{
    public int TotalPages { get; set; }
    public int PageIndex { get; set; }
    public PageList(List<T> items, int count,int pageIndex,int pageSize)
    {
        PageIndex = pageIndex;
        TotalPages = (int)Math.Ceiling(count/(double)pageSize);
        this.AddRange(items);        
    }
    public bool PreviousPage
    {
        get{
            return PageIndex > 1;
        }
    }
    public bool NextPage
    {
        get
        {
            return PageIndex < TotalPages;
        }
    }

}