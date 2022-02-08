const container = document.querySelector(".image_wrap");
const box = container.querySelectorAll(".item");

const{ width : containerWidth, 
       height : containerHeight}
= container.getBoundingClientRect();

var oriWidth = [];
var oriHeight = [];
for(let i = 0; i < box.length; i++){
    oriWidth[i] = box[i].getBoundingClientRect().width;
    oriHeight[i] = box[i].getBoundingClientRect().height;
    // original.oriWidth
}

let isDragging = null;
let originLeft = null;
let originTop = null;
let originX = null;
let originY = null;

var backupIndex;
for(let i = 0; i < box.length; i++){
    box[i].addEventListener("mousedown", function(e) {

        backupIndex = i;

        isDragging = true;
        originX = e.clientX;
        originY = e.clientY; 
        originLeft = box[i].offsetLeft;
        originTop = box[i].offsetTop;
    });
}


document.addEventListener("mousemove", function(e) {
    if(isDragging){
        const diffX = e.clientX - originX;
        const diffY = e.clientY - originY;

        const endOfXPoint = containerWidth - oriWidth[backupIndex];
        const endOfYPoint = containerHeight - oriHeight[backupIndex];

        box[backupIndex].style.left = Math.min(Math.max(0, originLeft + diffX), endOfXPoint) + "px";
        box[backupIndex].style.top = Math.min(Math.max(0, originTop + diffY), endOfYPoint) + "px";
    }
    
});


const coordinate = null;



$(".item").on("mouseup",function(e){
    isDragging = false;
      const coordLeft = $(this).position().left;
      const coordTop = $(this).position().top;
	  const postNo = $(this).children(".postNo").val();
	
	$.ajax({
		url : "saveCoord",
		data : {"coordLeft" : coordLeft, "coordTop" : coordTop, "postNo" : postNo}
		
	});
       
});


// 작성하기 팝업
const submitBtn = document.querySelector(".study_submit");

submitBtn.addEventListener("click", () => {
   layerPopup("studyWrite");
});






// 상세 조회
$(".item").on("dblclick",function(e){
	
	$(this).css({"width": "25%","height": "25%"});
	$(this).children(".nickname").removeClass("hidden");
	$(this).children(".far").removeClass("hidden");
	
	
});

// 아이템 크기 줄이기
$(".naturally").on("click",function(e){
	$(".item").css({"width" : "15%", "height" : "15%"});
	$(".item").children(".nickname").addClass("hidden");
	$(".item").children(".far").addClass("hidden");
});




// 아이템 삭제 
$(".far").click(function(){
	
	var answer = confirm('연구를 삭제하시겠습니까?');
	const postNo = $(this).siblings(".postNo").val();
	
	if(answer){
		
		$.ajax({
			
			url : "delete",
			data : {"postNo" : postNo},
			success : function(result){
				if(result>0){
					location.reload();
				}else{
					
				}
			}
		});
		
	}
	
});





	


