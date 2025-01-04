from django.shortcuts import render, get_object_or_404, redirect
from django.utils import timezone
from .models import Question

def index(request):
	question_list = Question.objects.order_by('-create_date') # -는 역방향 정렬
	context = {'question_list': question_list}
	# render 함수는 파이썬 데이터를 템플릿에 적용하여 HTML로 반환하는 함수
	# question_list 데이터를 html 파일에 적용하여 생성한 후 리턴해준다. 
	return render(request, 'pybo/question_list.html', context)

def detail(request, question_id):
	# objects 중 get으로 얻는 방식 -> pk가 question_id인 값을 얻거나, 404를 받는 방식
	question = get_object_or_404(Question, pk=question_id)
	context = {'question': question}
	return render(request, 'pybo/question_detail.html', context)

def answer_create(request, question_id):
	question = get_object_or_404(Question, pk=question_id)
	question.answer_set.create(content=request.POST.get('content'), create_date=timezone.now())
	return redirect('pybo:detail', question_id=question.id)