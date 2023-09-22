<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/list.js/2.3.1/list.min.js"></script>
    <link href="./css/header.css" rel="stylesheet">
    <link href="./css/admin.css" rel="stylesheet">
<body>



<script>
var vm1 = new Vue ({
  data() {
    return {
      items: [
        { id: 1, name: '항목 1' },
        { id: 2, name: '항목 2' },
        { id: 3, name: '항목 3' },
      ],
      selectedItems: [],
    };
  },
  methods: {
    handleCheckboxChange() {
      console.log('선택된 아이템 ID:', this.selectedItems);
    },
  },
})
</script>
</body>
</html>