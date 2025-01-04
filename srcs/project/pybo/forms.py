from django import forms
from pybo.models import Question

class QuestionForm(forms.ModelForm): # 괄호 안은 상속 받는다는 뜻
	class Meta:
		model = Question
		fields = ['subject', 'content']
		labels = {
			'subject': '제목',
			'content': '내용',
		}