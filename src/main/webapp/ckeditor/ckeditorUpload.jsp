<%@page import="egovframework.com.cmm.service.EgovProperties"%>
<%@ page contentType="text/html; charset=utf-8" %>

<%@ page import="java.util.UUID"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>

<%
    request.setCharacterEncoding("UTF-8");

    String uploadEditorImageFilePath = EgovProperties.getProperty("Globals.editorImageStorePath");
    String ctx      = request.getContextPath();              // 예: /yjcareer
    String fileUrl  = null;                                  // 최종적으로 에디터에 넘길 URL
    String callback = request.getParameter("CKEditorFuncNum"); // CKEditor4에서 넘겨주는 콜백 번호

    if (ServletFileUpload.isMultipartContent(request)) {
        ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
        uploadHandler.setHeaderEncoding("UTF-8");

        List<FileItem> items = uploadHandler.parseRequest(request);

        for (FileItem item : items) {
            // CKEditor 4 기본 업로드 필드 이름은 "upload"
            // 혹시 이전 코드 "file"로 올릴 수도 있으니 둘 다 허용
            if ("upload".equals(item.getFieldName()) || "file".equals(item.getFieldName())) {
                if (item.getSize() > 0) {
                    String originalName = item.getName();
                    String ext = "";
                    if (originalName != null && originalName.lastIndexOf(".") != -1) {
                        ext = originalName.substring(originalName.lastIndexOf(".") + 1);
                    }

                    // 저장 경로
                    String path = uploadEditorImageFilePath;
                    if (!path.endsWith(File.separator)) {
                        path += File.separator;
                    }
                    File dir = new File(path);
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    // UUID 파일명
                    String realname = UUID.randomUUID().toString() + (ext.equals("") ? "" : "." + ext);

                    // 물리 파일 저장
                    InputStream is = item.getInputStream();
                    OutputStream os = new FileOutputStream(path + realname);
                    byte[] b = new byte[1024 * 8];
                    int numRead;
                    while ((numRead = is.read(b, 0, b.length)) != -1) {
                        os.write(b, 0, numRead);
                    }
                    if (is != null) is.close();
                    os.flush();
                    os.close();

                    // 브라우저에서 접근할 URL
                    // 예: /yjcareer/editorImages/xxxx-uuid.jpg
                    // (여기서 /editorImages/ 부분은 실제 WAS의 정적 매핑에 맞게 수정)
                    fileUrl = ctx + "/editorImages/" + realname;

                    break;
                }
            }
        }
    }

    // CKEditor 4는 JSON이 아니라, JS 콜백 형태로 결과를 돌려줘야 함
    if (fileUrl != null && callback != null) {
%>
<script type="text/javascript">
    // 업로드 성공 시
    window.parent.CKEDITOR.tools.callFunction(<%=callback%>, '<%=fileUrl%>', '');
</script>
<%
    } else {
%>
<script type="text/javascript">
    // 업로드 실패 시 (에러 메시지 필요하면 세 번째 인자에 문자열 전달 가능)
    window.parent.alert('파일 업로드에 실패했습니다.');
</script>
<%
    }
%>
