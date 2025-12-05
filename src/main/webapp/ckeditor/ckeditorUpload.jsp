<%@page import="egovframework.com.cmm.service.EgovProperties"%>
<%@ page contentType="application/json; charset=utf-8" %>

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
    String uploadEditorImageFilePath = EgovProperties.getProperty("Globals.editorImageStorePath");
    String ctx = request.getContextPath();              // 예: /yjcareer
    String fileUrl = null;                              // 최종적으로 CKEditor에 줄 URL

    if (ServletFileUpload.isMultipartContent(request)) {
        ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
        uploadHandler.setHeaderEncoding("UTF-8");

        List<FileItem> items = uploadHandler.parseRequest(request);

        for (FileItem item : items) {
            // ✅ CKEditor 쪽에서 보낸 필드 이름과 맞춰야 함 (우리가 JS에서 'file'로 보냈었지?)
            if ("file".equals(item.getFieldName())) {
                if (item.getSize() > 0) {
                    String originalName = item.getName();
                    String ext = "";
                    if (originalName != null && originalName.lastIndexOf(".") != -1) {
                        ext = originalName.substring(originalName.lastIndexOf(".") + 1);
                    }

                    // 저장 경로 (글로벌 설정 + File.separator)
                    String path = uploadEditorImageFilePath + File.separator;
                    File dir = new File(path);
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    // UUID로 파일명 생성
                    String realname = UUID.randomUUID().toString() + "." + ext;

                    // 물리 파일 저장
                    InputStream is = item.getInputStream();
                    OutputStream os = new FileOutputStream(path + realname);
                    int numRead;
                    byte[] b = new byte[1024 * 8];
                    while ((numRead = is.read(b, 0, b.length)) != -1) {
                        os.write(b, 0, numRead);
                    }
                    if (is != null)  is.close();
                    os.flush();
                    os.close();

                    // 브라우저에서 접근할 URL (정적경로 매핑 기준에 맞게 조정)
                    // 예: /yjcareer/editorImages/xxx.jpg
                    fileUrl = ctx + "/editorImages/" + realname;

                    break;
                }
            }
        }
    }

    if (fileUrl != null) {
        // CKEditor5 커스텀 업로드 어댑터에서 기대하는 JSON 형식
        out.print("{\"url\":\"" + fileUrl + "\"}");
    } else {
        response.setStatus(400);
        out.print("{\"error\":\"upload failed\"}");
    }
%>
