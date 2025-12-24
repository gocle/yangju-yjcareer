package com.gocle.yangju.forest.comm.pagination;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class YangjuPaginationRendererUser extends AbstractPaginationRenderer {

    @Override
    public String renderPagination(PaginationInfo p, String jsFunction) {
        final int first       = p.getFirstPageNo();            // 보통 1
        final int last        = p.getLastPageNo();             // 전체 마지막 페이지 (= totalPageCount)
        final int current     = p.getCurrentPageNo();          // 현재 페이지
        final int firstOnList = p.getFirstPageNoOnPageList();  // 블록 시작
        final int lastOnList  = p.getLastPageNoOnPageList();   // 블록 끝
        final int total       = p.getTotalPageCount();         // 전체 페이지 수
        final int pageSize    = p.getPageSize();               // 블록당 페이지 수

        final String fn = (jsFunction == null || jsFunction.isEmpty()) ? "fn_search" : jsFunction;

        // 블록 이동 타겟
        int prevBlockTarget = Math.max(first, firstOnList - pageSize); // 이전 10페이지(블록)
        int nextBlockTarget = Math.min(last, firstOnList + pageSize);  // 다음 10페이지(블록)

        // 한 페이지 이동 타겟
        int prevOneTarget = Math.max(first, current - 1);
        int nextOneTarget = Math.min(last, current + 1);

        boolean isFirstPage = (current <= first);
        boolean isLastPage  = (current >= last);
        boolean isFirstBlock = (firstOnList <= first);
        boolean isLastBlock  = (lastOnList >= total);

        StringBuilder sb = new StringBuilder(512);

        sb.append("<div class=\"pagination\">");

        // ====== prev_group ======
        sb.append("<span class=\"page_btn prev_group\">");

        // 처음 페이지로 (prev_end)
        appendLink(sb, "prev_end", "처음 페이지로", first, fn, isFirstPage);

        // 이전 10페이지 이동 (prev)
        appendLink(sb, "prev", "이전 " + pageSize + "페이지 이동", prevBlockTarget, fn, isFirstBlock);

        // 이전 페이지 (prev_one)
        appendLinkWithIcon(sb, "prev_one", "이전 페이지", prevOneTarget, fn, isFirstPage, true);

        sb.append("</span>");

        // ====== page numbers ======
        sb.append("<span class=\"page\">");
        sb.append("<span class=\"page_wrap\">");

        int end = Math.min(lastOnList, total);
        for (int i = firstOnList; i <= end; i++) {
            if (i == current) {
                sb.append("<strong title=\"현재 ").append(i).append("페이지\">").append(i).append("</strong>");
            } else {
                sb.append("<a href=\"?pageIndex=").append(i).append("\"")
                  .append(" onclick=\"").append(fn).append("(").append(i).append(");return false;\">")
                  .append(i).append("</a>");
            }
        }

        sb.append("</span>");
        sb.append("</span>");

        // ====== next_group ======
        sb.append("<span class=\"page_btn next_group\">");

        // 다음 페이지 (next_one)
        appendLinkWithIcon(sb, "next_one", "다음 페이지", nextOneTarget, fn, isLastPage, false);

        // 다음 10페이지 이동 (next)
        appendLink(sb, "next", "다음 " + pageSize + "페이지 이동", nextBlockTarget, fn, isLastBlock);

        // 끝 페이지로 (next_end)
        appendLink(sb, "next_end", "끝 페이지로", last, fn, isLastPage);

        sb.append("</span>");

        sb.append("</div>");

        return sb.toString();
    }

    /** 기본 링크 (disabled면 클릭 막고 href #) */
    private void appendLink(StringBuilder sb, String cssClass, String text,
                            int target, String fn, boolean disabled) {
        sb.append("<a href=\"?pageIndex=").append(disabled ? "#" : target).append("\"")
          .append(" class=\"").append(cssClass).append("\"");

        if (disabled) {
            sb.append(" onclick=\"return false;\" aria-disabled=\"true\"");
        } else {
            sb.append(" onclick=\"").append(fn).append("(").append(target).append(");return false;\"");
        }

        sb.append(">").append(text).append("</a>");
    }

    /**
     * 아이콘 포함 링크 (참고 마크업처럼 <i></i> 위치가 prev_one / next_one에서 다름)
     * prev_one: <a ...><i></i>이전 페이지</a>
     * next_one: <a ...>다음 페이지<i></i></a>
     */
    private void appendLinkWithIcon(StringBuilder sb, String cssClass, String text,
                                    int target, String fn, boolean disabled, boolean iconFirst) {
        sb.append("<a href=\"?pageIndex=").append(disabled ? "#" : target).append("\"")
          .append(" class=\"").append(cssClass).append("\"");

        if (disabled) {
            sb.append(" onclick=\"return false;\" aria-disabled=\"true\"");
        } else {
            sb.append(" onclick=\"").append(fn).append("(").append(target).append(");return false;\"");
        }

        sb.append(">");

        if (iconFirst) sb.append("<i></i>");
        sb.append(text);
        if (!iconFirst) sb.append("<i></i>");

        sb.append("</a>");
    }
}
