package com.gocle.yangju.forest.comm.pagination;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class YangjuPaginationRendererUser extends AbstractPaginationRenderer {

    @Override
    public String renderPagination(PaginationInfo p, String jsFunction) {
        final int first        = p.getFirstPageNo();           // 보통 1
        final int last         = p.getLastPageNo();            // 전체 마지막 페이지
        final int current      = p.getCurrentPageNo();         // 현재 페이지
        final int firstOnList  = p.getFirstPageNoOnPageList(); // 블록 시작 페이지
        final int lastOnList   = p.getLastPageNoOnPageList();  // 블록 끝 페이지
        final int total        = p.getTotalPageCount();        // 전체 페이지 수
        final int pageSize     = p.getPageSize();              // 한 블록의 페이지 개수

        final String fn = (jsFunction == null || jsFunction.isEmpty()) ? "fn_search" : jsFunction;

        StringBuilder sb = new StringBuilder(256);
        sb.append("<nav class=\"pagination\" aria-label=\"페이지 네비게이션\">");

        // 이전 버튼 (블록 이전 또는 첫 페이지)
        int prevTarget = Math.max(first, (total > pageSize && firstOnList > pageSize) ? (firstOnList - 1) : (current - 1));
        boolean prevDisabled = current <= first;
        appendPageLink(sb, "btn-before", "이전 페이지", prevTarget, fn, prevDisabled, false);

        // 숫자 링크
        int end = Math.min(lastOnList, total);
        for (int i = firstOnList; i <= end; i++) {
            boolean isCurrent = (i == current);
            appendNumberLink(sb, i, fn, isCurrent);
        }

        // 다음 버튼 (블록 다음 또는 마지막 페이지)
        int nextTarget = Math.min(last, (total > pageSize && lastOnList < total) ? (firstOnList + pageSize) : (current + 1));
        boolean nextDisabled = current >= last;
        appendPageLink(sb, "btn-after", "다음 페이지", nextTarget, fn, nextDisabled, true);

        sb.append("</nav>");
        return sb.toString();
    }

    /** 이전/다음 버튼 출력 (항상 <a> 태그로 출력) */
    private void appendPageLink(StringBuilder sb, String cssClass, String ariaLabel,
                                int target, String fn, boolean disabled, boolean isNext) {
        sb.append("<a href=\"?pageIndex=").append(disabled ? "#" : target)
          .append("\" class=\"").append(cssClass).append("\"")
          .append(" aria-label=\"").append(ariaLabel).append("\"");

        if (disabled) {
            // 클릭 막기
            sb.append(" onclick=\"return false;\"");
        } else {
            sb.append(" onclick=\"").append(fn).append("(").append(target).append(");return false;\"");
        }

        sb.append(">")
          .append(isNext ? "다음" : "이전")
          .append("</a>");
    }

    /** 숫자 링크 출력 (현재 페이지는 current 클래스 + aria-current) */
    private void appendNumberLink(StringBuilder sb, int page, String fn, boolean isCurrent) {
        if (isCurrent) {
            sb.append("<a class=\"current\" href=\"#\" aria-current=\"page\">")
              .append(page).append("</a>");
        } else {
            sb.append("<a href=\"?pageIndex=").append(page).append("\"")
              .append(" onclick=\"").append(fn).append("(").append(page).append(");return false;\">")
              .append(page).append("</a>");
        }
    }
}
