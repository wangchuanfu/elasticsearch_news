package com.esspnews.controller;

import com.esspnews.utils.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.index.query.MultiMatchQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;

import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by wangchuanfu on 17/8/10.
 */

@WebServlet(name = "/SearchNews", urlPatterns = "/SearchNews")
public class SearchServlet extends HttpServlet {
    protected final static Log logger = LogFactory.getLog(SearchServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        /**
         * 搜索关键字
         */
        req.setCharacterEncoding("UTF-8");
        String keyWords = req.getParameter("query");

        byte[]  real_name = keyWords.getBytes("ISO-8859-1");
       // keyWords =new String(real_name, "UTF-8");
        /**
         * 判断是否为拼音
         */
        String pinyinKeyword = this.isPinyin(keyWords);
        logger.info(pinyinKeyword);
        // 分页信息
        Integer pageSize = 0;// 每页显示条数
        int pageNum =1 ;// 页码
        pageSize = pageSize == 0 ? 10 : pageSize;

        String pageNumStr=req.getParameter("pageNum");


        if (pageNumStr!=null&&Integer.parseInt(pageNumStr)>1){
            pageNum=Integer.parseInt(pageNumStr);
        }
        searchSpnews(keyWords, pageNum,req);

        req.setAttribute("queryBack", keyWords);
        req.getRequestDispatcher("result.jsp").forward(req, resp);

    }

    private String isPinyin(String keyWords) {
        return null;
    }

    private void searchSpnews(String keyWords, int pageNum,HttpServletRequest req) throws UnsupportedEncodingException {

        long start = System.currentTimeMillis();
        TransportClient client = EsUtils.getSingleClient();
        MultiMatchQueryBuilder multiMatchQuery = QueryBuilders
                .multiMatchQuery(keyWords, "title", "content");

        System.out.print(multiMatchQuery);
        HighlightBuilder highlightBuilder = new HighlightBuilder()
                .preTags("<span style=\"color:red\">")
                .postTags("</span>")
                .field("title")
                .field("content")
                .field("key_word");
        System.out.print(highlightBuilder.toString());

                 SearchResponse searchResponse = client.prepareSearch("spnews")
                .setTypes("news")
                .setQuery(multiMatchQuery)
                .highlighter(highlightBuilder)
                .setFrom((pageNum-1)*10)
                .setSize(10)
                .execute()
                .actionGet();

        SearchHits hits = searchResponse.getHits();
        ArrayList<Map<String, Object>> newslist = new ArrayList<Map<String, Object>>();
        for (SearchHit hit : hits) {
            Map<String, Object> news = hit.getSourceAsMap();

            HighlightField hTitle = hit.getHighlightFields().get("title");
            if (hTitle != null) {
                Text[] fragments = hTitle.fragments();
                String hTitleStr = "";
                for (Text text : fragments) {
                    hTitleStr += text;
                }
                news.put("title", hTitleStr);
            }

            HighlightField hContent = hit.getHighlightFields().get("content");
            if (hContent != null) {
                Text[] fragments = hContent.fragments();
                String hContentStr = "";
                for (Text text : fragments) {
                    hContentStr += text;
                }
                news.put("content", hContentStr);
            }
            newslist.add(news);
        }
        long end = System.currentTimeMillis();
        req.setAttribute("newslist", newslist);
        //总条数,每页默认展示10条数据
        // 分页信息
        Integer pageSize = 10;// 每页显示条数

        String pageNumStr=req.getParameter("pageNum");
        // 1、初始化请求参数
        SheepPage sheepPage = null;
        try {
            sheepPage = initialPage(keyWords
                    , pageSize+"", pageNumStr);
        } catch (Exception e) {
            e.printStackTrace();
        }

        PageRequest pageRequest = new PageRequest(sheepPage.getPageNumber()+1,sheepPage.getPageSize()) ;

        Page<Object> pagination = new PageImpl<Object>((List<Object>)sheepPage.getResults(),pageRequest,hits.getTotalHits());
        req.setAttribute("totalHits", hits.getTotalHits() + "");

        req.setCharacterEncoding("UTF-8");
        String key = req.getParameter("query");
        byte[]  real_name = key.getBytes("ISO-8859-1");
        //key =new String(real_name, "UTF-8");
        req.setAttribute("key", key );

        req.setAttribute("pagination", pagination);
        System.out.print(pagination.getTotalCount()+"==============");
        System.out.print(pagination.getTotalPage());
        req.setAttribute("totalTime", (end - start) + "");
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


    /**
     * {
     "query": {
     "multi_match": {
     "query": "足球",
     "fields": [
     "content^1.0",
     "title^1.0"
     ],
     "type": "best_fields",
     "operator": "OR",
     "slop": 0,
     "prefix_length": 0,
     "max_expansions": 50,
     "lenient": false,
     "zero_terms_query": "NONE",
     "boost": 1
     }
     },
     "highlight": {
     "pre_tags": [
     "<font style='color:red'>"
     ],
     "post_tags": [
     "</font>"
     ],
     "fields": {
     "title": {},
     "content": {}
     }
     }
     }
     */

    private SheepPage initialPage(String originalKeyword
                                 , String pageSize, String pageNumber)
            throws Exception {
        SheepPage pageable = new SheepPage(originalKeyword,  pageSize, pageNumber);
        return pageable;
    }
}
