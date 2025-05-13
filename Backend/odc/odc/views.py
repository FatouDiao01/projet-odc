from django.http import JsonResponse
from django.http import JsonResponse

def health_check(request):
    return JsonResponse({'status': 'ok'})

def health_check(request):
    return JsonResponse({"status": "ok"})
