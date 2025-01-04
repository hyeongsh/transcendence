from django.shortcuts import render
from .models import Question

def index(request):
	question_list = Question.objects.order_by('-create_date') # -는 역방향 정렬
	context = {'question_list': question_list}
	# render 함수는 파이썬 데이터를 템플릿에 적용하여 HTML로 반환하는 함수
	# question_list 데이터를 html 파일에 적용하여 생성한 후 리턴해준다. 
	return render(request, 'pybo/question_list.html', context)