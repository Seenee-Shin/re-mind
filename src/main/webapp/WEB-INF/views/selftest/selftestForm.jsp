<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="self_banner">
  <div>누구나 마음 속에 수많은 고민들이 있습니다.</div>
  <div>도움이 필요할 땐 언제든지 KH정보교육원 과 함께하세요!</div>
</article>
<article class="self_content">
  <div class="self_content_title">
    <div>나의 마음건강을 체크해보세요.</div>
    <div>심리 자가진단 테스트</div>
  </div>
  <form method="POST" class="self_content_form">
    <div class="self_content_option">
      <div class="self_content_option1">
        <div>우울증</div>
        <div>불안장애</div>
        <div>폭식증</div>
        <div>알코올의존</div>
        <div>스트레스</div>
      </div>
      <div class="self_content_option2">
        <div>자존감</div>
        <div>인터넷중독</div>
        <div style="color: rgb(0 0 0 / 0.5); cursor: no-drop;">추가준비중</div>
        <div style="color: rgb(0 0 0 / 0.5); cursor: no-drop;">추가준비중</div>
        <div style="color: rgb(0 0 0 / 0.5); cursor: no-drop;">추가준비중</div>
      </div>
    </div>
    <div class="selfTest">
      <div class="selfTest_title">
        <h1>자존감 자가진단 테스트</h1>
        <div>
          이 검사는 자신에 대해서 어떻게 느끼는 지를 <br>
          알아보기 위한 것입니다.<br><br>
          각 문자를 읽고, 자신에게 해당되는 정도를 <br>
          나타내는 항목에 체크하여 주십시오.
        </div>
      </div>
      <div class="selfTest_content">
        <span>01</span>
        <span></span>
        <span>총 10문항</span>
        <div>나는 내가 적어도 다른 사람만큼은 가치있는 사람이라고 느낀다.</div>
        <div id="selfTest_content_option">
          <div id="1" class="selfTest_result">대체로 그렇지 않다</div>
          <div id="2" class="selfTest_result">보통이다</div>
          <div id="3" class="selfTest_result">대체로 그렇다</div>
          <div id="4" class="selfTest_result">항상 그렇다</div>
        </div>
      </div>
    </div>
    <!-- 버튼 -->
    <div class="selfTest_btn">
      <button class="selfTest_prev_btn">이전</button>
      <button id="selfTest_next_btn" class="selfTest_next_btn">다음</button>
    </div>
    <button type="button" class="mb_selfTest_btn">테스트 진행</button>
  </form>
</article>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script>

</script>
