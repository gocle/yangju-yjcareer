package com.gocle.yangju.forest.comm.pagination;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class YangjuPaginationRendererAdmin extends AbstractPaginationRenderer {

    @Override
    public String renderPagination(PaginationInfo p, String jsFunction) {
        final int first = p.getFirstPageNo();
        final int firstOnList = p.getFirstPageNoOnPageList();
        final int lastOnList  = p.getLastPageNoOnPageList();
        final int current     = p.getCurrentPageNo();
        final int total       = p.getTotalPageCount();
        final int pageSize    = p.getPageSize();
        final int last        = p.getLastPageNo();

        String fn = (jsFunction == null || jsFunction.isEmpty()) ? "fn_search" : jsFunction;

        StringBuilder sb = new StringBuilder(512);
        sb.append("<ul class=\"pagination\">");

        // << (첫 페이지)
        appendEdge(sb, "&lt;&lt;", "page-btn1", fn, first);

        // < (이전 블록 시작 또는 1)
        int prevTarget = (total > pageSize)
                ? (firstOnList > pageSize ? (firstOnList - 1) : first)
                : first;
        appendEdge(sb, "&lt;", "page-btn2", fn, prevTarget);

        // 숫자
        int end = Math.min(lastOnList, total);
        for (int i = firstOnList; i <= end; i++) {
            if (i == current) {
                sb.append("<li class=\"num active\"><a href=\"#\">").append(i).append("</a></li>");
            } else {
                sb.append("<li><a href=\"?pageIndex=").append(i)
                  .append("\" onclick=\"").append(fn).append("(").append(i).append(");return false; \" class=\"num\">")
                  .append(i).append("</a></li>");
            }
        }

        // > (다음 블록 시작 또는 마지막)
        int nextTarget = (total > pageSize)
                ? (lastOnList < total ? (firstOnList + pageSize) : last)
                : last;
        appendEdge(sb, "&gt;", "page-btn3", fn, nextTarget);

        // >> (마지막 페이지)
        appendEdge(sb, "&gt;&gt;", "page-btn4", fn, last);

        sb.append("</ul>");
        return sb.toString();
    }

    private void appendEdge(StringBuilder sb, String label, String css, String fn, int target) {
        sb.append("<li><a href=\"?pageIndex=").append(target)
          .append("\" onclick=\"").append(fn).append("(").append(target).append(");return false; \" class=\"")
          .append(css).append("\">").append(label).append("</a></li>");
    }
}
