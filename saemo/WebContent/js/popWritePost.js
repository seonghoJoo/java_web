const $popWriteWrap= $(".pop_write_wrap");
const $popWrite = $('.pop_write');
// 닫기 버튼
const $close = $('.close');
$close.click(function (e) {
    $popWriteWrap.removeClass('on');
    //$("html").removeClass("on");
});

const $postingBtn = $('.posting_btn');
$postingBtn.click(function (e) {
    e.preventDefault();
    $popWriteWrap.addClass("on");
    //$("html").addClass("on");
})



$("#writeForm").on("submit",function (e) {

    e.preventDefault();
    const contents = quill.getContents();

    console.log(contents.ops[0].insert);

    // 첫번째 값이 엔터면 아무것도 글자를 쓰지 않았음
    if(contents.ops[0].insert=="\n") {
        alert("글자를 입력해주세요!");
        return false;
    }else {
        const contentString =JSON.stringify(contents);
        //input type=hidden에 value로 세팅
        $("#contents").val(contentString);
        $popWriteWrap.removeClass('on');
        //$("html").removeClass("on");
        return true;
    }

});//#writeForm submit() end

var quill = new Quill('#editorContainer', {
    modules: {
        toolbar: {

            container: '#toolbar-container',

            //이미지 선택시 파일 업로드를 위해서
            // handlers: {
            //     'image': selectLocalImage
            // }
        }
    },
    theme: 'snow'
});


$("#image_input").on("change",function() {

    const file = this.files[0];


    console.log(file);

    //image/ 로 시작하는

    if (/^image\//.test(file.type)) {

        //alert("여기에 오면 파일이 있고 사진임");

        //multipart/form-data에 필요함
        const formData = new FormData();

        formData.append("uploadImg", file, file.name);
        formData.append("type", "B");//B는 board의 줄임말

        //여기서 ajax로 파일 업로드 수행
        $.ajax({
            url:"ajax/uploadImage.json",
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
                // image
                // delta라는 개념을 하나 만들어라
                // 요소를 직접 못넣는다. custom delta
                quill.insertEmbed(idx, 'image', json.url);
                quill.insertText( quill.getSelection() + 1, ' ', Quill.sources.SILENT);

            }
        });


    } else {
        alert("이미지를 선택해주세요!");
    }
})

$("#file_input").on("change",function() {

    const file = this.files[0];


    console.log(file);

    //image/ 로 시작하는
    //multipart/form-data에 필요함
    const formData = new FormData();

    formData.append("uploadImg", file, file.name);
    formData.append("type", "B");//B는 board의 줄임말

    //여기서 ajax로 파일 업로드 수행
    $.ajax({
        url:"ajax/uploadFile.json",
        processData : false,//multipart/form-data
        contentType : false,//multipart/form-data
        data : formData,//multipart/form-data
        type : 'POST',//multipart/form-data
        dataType : "json",
        error : function(xhr, error, code) {
            alert("에러:" + code);
        },
        success:function(json) {
            const fileAttachmentTmpl = _.template($('#fileAttachmentTmpl').html());
            $('.file_list').append(fileAttachmentTmpl);

        }
    });

})


var Size = Quill.import('attributors/style/size');
Size.whitelist = ['20px', '28px', '36px','48px'];
Quill.register(Size, true);

var ColorClass = Quill.import('attributors/class/color');
Quill.register(ColorClass, true);

$(document).on("click", '.remove_question',function (e) {
    const $this = $(this);
    //여기서 ajax로 파일 업로드 수행
    $.ajax({
        url:"ajax/deleteFile.json",
        type : 'POST',//multipart/form-data
        dataType : "json",
        error : function(xhr, error, code) {
            alert("에러:" + code);
        },
        success:function(json) {
            alert(json.result);
            if(json.result==true) {
                $this.parent().remove();
            }
        }
    });
});