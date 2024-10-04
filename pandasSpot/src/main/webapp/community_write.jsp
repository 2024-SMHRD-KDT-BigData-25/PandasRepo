<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
 
<div>
  <h2>글 작성</h2>
  <div>
    <div>게시판</div>
    <div>


    	  <form action="write" method="post">
		    <div >
		      <label for="title">제목:</label>
		      <div>
		        <input type="text" name="title" id="title" placeholder="Enter title">
		      </div>
		    </div>
		    <div>
		      <label for="content">내용:</label>
		      <div>          
		        <textarea rows="10" name="content"></textarea>
		      </div>
		    </div>
		    <div>
		      <label for="writer">작성자:</label>
		      <div>          
		        <input type="text" name="writer">
		      </div>
		    </div>
		    <div>
		      <label for="photo">이미지:</label>
		      <div>          
		        <input type="file" name="img">
		      </div>
		    </div>		    
		    <div>        
		      <div>
		        <button type="submit">작성</button>
		        <button type="reset">메뉴</button>
		      </div>
		    </div>
		  </form>
    </div>
    <div class="panel-footer">글 작성</div>
  </div>
</div>

</body>
</html>