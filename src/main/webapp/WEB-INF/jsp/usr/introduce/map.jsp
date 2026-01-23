<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/usr/layout/top.do" />
<c:import url="/usr/menu/header.do" />

<div id="container">
  <div class="wrap clearfix">
    <main class="colgroup">
      <article>
        <header class="sub_head">
          <div class="sub_title">
            <p class="first_title">센터 소개</p>
            <h2>찾아오시는 길</h2>
          </div>

          <div class="sub_head_wrap">
            <c:import url="/usr/menu/sub.do" />

            <div class="addons">
              <ul class="addons_list">
                <li class="addons_item print">
                  <button type="button" onclick="window.print();" class="addons_button">인쇄</button>
                </li>
              </ul>
            </div>
          </div>
        </header>

        <div id="contents" class="cts4126">

          <section class="wayfind location">

            <nav class="wayfind-tabs" aria-label="센터 선택">
              <a class="tab is-active" href="#loc-1">꿈자람 제1센터</a>
              <a class="tab" href="#loc-2">꿈자람 제2센터</a>
              <a class="tab" href="#loc-3">꿈자람 제3센터</a>
              <a class="tab" href="#loc-4">꿈자람 제4센터</a>
            </nav>

            <div class="wayfind-list">

              <!-- 1. 꿈자람 제1센터 -->
              <article id="loc-1" class="loc-row">
                <div class="loc-map">
                  <div
                    id="daumRoughmapContainer1769046011230"
                    class="root_daum_roughmap root_daum_roughmap_landing roughmap"
                    data-timestamp="1769046011230"
                    data-key="g2sq7phk4r5"
                  ></div>
                </div>

                <div class="location_box">
                  <div class="visual-btn">
                    <span class="tit">진로진학지원센터</span>
                  </div>

                  <div class="location_item">
                    <p class="location_title">주소</p>
                    <p class="location_text">경기도 양주시 옥정동로7나길 18(드림타워Ⅰ) 211호</p>
                  </div>

                  <div class="location_item">
                    <p class="location_title">전화번호</p>
                    <p class="location_text">031-8082-7953~4</p>
                  </div>
                </div>
                
                <div class="location_box">
                  <div class="visual-btn">
                    <span class="tit">동부권 AI디지털교실</span>
                  </div>

                  <div class="location_item">
                    <p class="location_title">주소</p>
                    <p class="location_text">경기도 양주시 옥정동로7나길 18(드림타워Ⅰ) 211호</p>
                  </div>

                  <div class="location_item">
                    <p class="location_title">전화번호</p>
                    <p class="location_text">031-857-6501</p>
                  </div>
                </div>
                
              </article>
              
              <!-- 꿈자람 제2센터 -->
              <article id="loc-2" class="loc-row">
                <div class="loc-map">
                  <div
                    id="daumRoughmapContainer1769046160615"
                    class="root_daum_roughmap root_daum_roughmap_landing roughmap"
                    data-timestamp="1769046160615"
                    data-key="g2r4idncy35"
                  ></div>
                </div>

                <div class="location_box">
                  <div class="visual-btn">
                    <span class="tit">서부권 AI디지털교실</span>
                  </div>
                  
                  <div class="location_item">
                    <p class="location_title">주소</p>
                    <p class="location_text">경기도 양주시 광적면 광적로 5, 1층</p>
                  </div>

                  <div class="location_item">
                    <p class="location_title">전화번호</p>
                    <p class="location_text">031-837-0955</p>
                  </div>
                </div>
                
                 <div class="location_box">
                  <div class="visual-btn">
                    <span class="tit">서부권 거점돌봄교실</span>
                  </div>
                  
                  <div class="location_item">
                    <p class="location_title">주소</p>
                    <p class="location_text">경기도 양주시 광적면 광적로5, 1층</p>
                  </div>

                  <div class="location_item">
                    <p class="location_title">전화번호</p>
                    <p class="location_text">031-837-0892~3</p>
                  </div>
                </div>
              </article>
              
			  <!-- 꿈자람 제3센터 -->
              <article id="loc-3" class="loc-row">
                <div class="loc-map">
                  <div
                    id="daumRoughmapContainer1769046120778"
                    class="root_daum_roughmap root_daum_roughmap_landing roughmap"
                    data-timestamp="1769046120778"
                    data-key="g2ssriuyn3c"
                  ></div>
                </div>

                <div class="location_box">
                  <div class="visual-btn">
                    <span class="tit">동부권 거점돌봄교실</span>
                  </div>
                  
                  <div class="location_item">
                    <p class="location_title">주소</p>
                    <p class="location_text">경기도 양주시 옥정동로 188 옥정호수초등학교 내 다함께 돌봄센터</p>
                  </div>

                  <div class="location_item">
                    <p class="location_title">전화번호</p>
                    <p class="location_text">031-868-5418</p>
                  </div>
                </div>
              </article>

              <!-- 꿈자람 제4센터 -->
              <article id="loc-4" class="loc-row">
              	<!-- <div class="loc-map">
                  <div class="map-empty"><span>2026.03. ~ (개소예정)</span></div>
                </div> -->
                <div class="loc-map">
                  <div
                    id="daumRoughmapContainer1769141536347"
                    class="root_daum_roughmap root_daum_roughmap_landing roughmap"
                    data-timestamp="1769141536347"
                    data-key="ghefsjdshnq"
                  ></div>
                </div>
                <div class="location_box">
                  <div class="visual-btn">
                    <span class="tit">양주고읍 LH14단지 자기주도학습센터</span>
                  </div>
                  <div class="location_item">
                    <p class="location_text">2026.03. ~ (개소예정)</p>
                  </div>
                  <div class="location_item" style="display: none;">
                    <p class="location_title">주소</p>
                    <p class="location_text">2026.03. ~ (개소예정)</p>
                  </div>
                </div>
              </article>

            </div>
          </section>

          <script charset="UTF-8" class="daum_roughmap_loader_script"
            src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

          <script>
          document.addEventListener('DOMContentLoaded', function () {

        	  const tabs = Array.from(document.querySelectorAll('.wayfind-tabs .tab'));
        	  const articles = Array.from(document.querySelectorAll('.wayfind-list .loc-row'));

        	  if (!tabs.length || !articles.length) return;

        	  const rendered = {};

        	  function renderMap(hash){
        	    const target = document.querySelector(hash);
        	    if(!target) return;

        	    const mapEl = target.querySelector('.root_daum_roughmap');
        	    if(!mapEl) return;

        	    const timestamp = mapEl.getAttribute('data-timestamp');
        	    const key = mapEl.getAttribute('data-key');

        	    if(!timestamp || !key) return;

        	    if(rendered[hash]) return;
        	    
        	    const mapH = window.innerWidth <= 768 ? "300" : "600";

        	    setTimeout(function(){
        	      try{
        	        new daum.roughmap.Lander({
        	          "timestamp": timestamp,
        	          "key": key,
        	          "mapHeight": mapH
        	        }).render();

        	        rendered[hash] = true;
        	      }catch(err){
        	        console.error('roughmap render error:', err);
        	      }
        	    }, 200);
        	  }

        	  function setActive(hash) {
        		  
        	    tabs.forEach(t => t.classList.toggle('is-active', t.getAttribute('href') === hash));

        	    articles.forEach(a => {
        	      a.style.display = ('#' + a.id === hash) ? 'block' : 'none';
        	    });

        	    // 지도 렌더
        	    renderMap(hash);

        	    history.replaceState(null, '', hash);
        	  }

        	  tabs.forEach(t => {
        	    t.addEventListener('click', function(e){
        	      e.preventDefault();
        	      const hash = t.getAttribute('href');
        	      if(!hash) return;
        	      setActive(hash);
        	    });
        	  });

        	  // init
        	  const initHash =
        	    (location.hash && document.querySelector(location.hash))
        	      ? location.hash
        	      : (tabs[0].getAttribute('href') || '#loc-1');

        	  setActive(initHash);
        	});
          </script>


        </div>

      </article>
    </main>
  </div>
</div>

<c:import url="/usr/layout/footer.do" />
