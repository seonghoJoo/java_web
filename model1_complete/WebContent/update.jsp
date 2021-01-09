<%@page import="com.bmj.model1.dao.BoardDAO"%>
<%@page import="com.bmj.model1.vo.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	
	int no = 0;
	
	if(noStr!=null) {
		no = Integer.parseInt(noStr);
	}//if end
	
	Article article = BoardDAO.selectOne(no);
	
	if(article==null) {
		response.sendRedirect("/index.jsp");
		return;
	}
%>    	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<%@ include file="/WEB-INF/template/link.jsp"%>
<link rel="stylesheet" href="/css/quill.snow.css" />
<link rel="stylesheet" href="/css/form.css" />
<link rel="stylesheet" href="/css/quill-custom.css" />
<link href="https://fonts.googleapis.com/css?family=Jua|Nanum+Pen+Script|Poor+Story|Yeon+Sung&display=swap"
	rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp"%>
<h2 class="title">
	<i class="fas fa-pen-nib"></i> 게시글수정
</h2>
<div id='formBox'>
	<!--서버로 데이터를 보내는 폼 -->
	<form id="writeForm" action="/update.bmj" method="post">
		<fieldset>
			<input type="hidden" name="no" value="<%=no%>">
			<input type="hidden" id="contents" name="contents">
			<legend class="screen_out">글수정폼</legend>
			<div id="titleBox">
				<label for="title">제 목</label> <input type="text"
					autocomplete="off" id="title"
					value="<%=article.getTitle() %>"
					 name="title" placeholder="제목을 입력하세요" />
			</div>
			<div id="standalone-container">
				<div id="toolbar-container">
					<span class="ql-formats"> <select class="ql-font">
							<!-- 2) 필요한 폰트를 option으로 마크업 -->
							<option value="">기본</option>
							<option value="nanumPen">나눔펜</option>
							<option value="yeonSung">연성체</option>
							<option value="poorStory">가난한이야기체</option>
							<option value="jua">주아체</option>
					</select> <select class="ql-size">
							<option>20px</option>
							<option>28px</option>
							<option>36px</option>
							<option>48px</option>
					</select>
					</span> <span class="ql-formats">
						<button class="ql-bold"></button>
						<button class="ql-italic"></button>
						<button class="ql-underline"></button>
						<button class="ql-strike"></button>
					</span> <span class="ql-formats"> <select class="ql-color"></select>
						<select class="ql-background"></select>
					</span>
					<span class="ql-formats">
						<button class="ql-list" value="ordered"></button>
						<button class="ql-list" value="bullet"></button>
						<button class="ql-indent" value="-1"></button>
						<button class="ql-indent" value="+1"></button>
					</span> <span class="ql-formats">
						<button class="ql-link"></button>
						<button class="ql-image"></button>
						<button class="ql-video"></button>
					</span>
				</div>
				<div id="editor-container"><%=article.getContents()%></div>
			</div>
			<div class="box_btn">
				<button class="btn" type="submit">
					<i class="fas fa-pen-nib"></i> 글수정
				</button>
				<button class="btn" type="reset">
					<i class="fas fa-redo"></i> 취 소
				</button>
				<a class="btn" href="/index.jsp"><i class="far fa-list-alt"></i>
					게시판으로</a>
			</div>
		</fieldset>
	</form>
	<input type="file" name="upload" id="upload" />
</div>
<%@ include file="/WEB-INF/template/footer.jsp"%>
<script src="/js/quill.min.js"></script>
<script>

    const $title = $("#title");

    const $contents = $("#contents");
    

    $("#title").focus();

    $("#writeForm").submit(function(e) {
    	
        const title = $("#title").val();

        if (title.length == 0) {
            alert("제목을 입력하세요.");

            $title.focus();

            return false;
        }//if end

        const contents = 
        	$(".ql-editor").html();

        const text = $(".ql-editor").text();
        
        console.log("text:"+text);
        console.log("contents:"+contents);
        
        if (text.length <= 0) {
            alert("내용을 입력하세요.");
            return false;
        }//if end

        $contents.val(contents);

        return true;

    });//submit() end
    

    var quill = new Quill('#editor-container', {
        modules: {
            toolbar: {
         	container:'#toolbar-container',
         	handlers: {
                 'image': selectLocalImage
            	}
    		}//toolbar
        },
        theme: 'snow'
    });

    //이미지 업로드 함수
    function selectLocalImage() {
	
    const input = $("<input type='file'>");
    input.click();

    input.on("change",function() {

      const file = this.files[0];

      if (/^image\//.test(file.type)) {

        //alert("여기에 오면 파일이 있고 사진임");

        //multipart/form-data에 필요함
        const formData = new FormData();

        formData.append("uploadImage", file, file.name);
        formData.append("type", "B");//B는 board의 줄임말

        //여기서 ajax로 파일 업로드 수행
        $.ajax({
          url:"/ajax/uploadImage.json",
          processData : false,//multipart/form-data
          contentType : false,//multipart/form-data
          data : formData,//multipart/form-data
          type : 'POST',//multipart/form-data
          dataType : "json",
          error : function(xhr, error, code) {
            alert("에러:" + code);
          },
          success:function(json) {
            const range = quill.getSelection();
            console.log(range);

            let idx = 0;
            if(range!=null) {
              idx = range.index;
            }

            quill.insertEmbed(idx, 'image', "/upload/"+json.imageName);
            quill.insertText( quill.getSelection() + 1, ' ', Quill.sources.SILENT);

          }
        });

     } else {
        alert("이미지를 선택해주세요!");
      }
    })
  }//selectLocalImage() end
    
    
//Font에 대한 설정을 불러와서
  const Font = Quill.import('formats/font');
  //우리가 필요한 폰트를 넣고
  Font.whitelist = ['nanumPen','yeonSung','poorStory','jua'];
  //다시 등록
  Quill.register(Font, true);

  const Size = Quill.import('attributors/style/size');
  Size.whitelist = ['20px', '28px', '36px','48px'];
  Quill.register(Size, true);
    
    
</script>
</body>
</html>
