package com.teamawesome.awesomedonor.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service// 그리고 이걸 스캔해줄 코드를 root에 넣어야 한다. 
@Aspect //이게 결합자라는 어노테이션. 이것도 인스턴스가 생성이 되어야 함. 이건 의미적인 어노테이션. 이걸로 컨테이너에 들어가지는 않음. 그래서 다른 것을 붙이지 않으면 객체를 새로 생성해주어야 함.
public class AOPServiceLogger {

	@Pointcut("execution(* com.teamawesome.awesomedonor.service..*.*(..))")
	//누가 실행될 때 aop를 적용할지 포인트 컷으로 정하겠다!
	//'..'은 서비스 패키지 안의 하위 클래스(대상) 모두를 의미함. 그 가운데 뒤가 Impl로 끝나는 것 
	public void servicePointCut() {}
	
	@Around("servicePointCut()") // servicePointCut을 Around의 형태로 적용하겠다. before와 after는 어떻게 되었는지 확인해볼 것. 
	public Object printLog(ProceedingJoinPoint pjp) throws Throwable {//Throwable로 던지면 좋은 게 뭔가... 어떤 식으로 뜨는 것인가.-->printstackTrace가 뜨는 것임. 
		
		String logText = "====="+pjp.getSignature().getName()+" 실행 전=====";//여기서 signature은 뭔가...
		System.out.println(logText);
		
		Object obj = pjp.proceed();//포인트컷에 해당하는 메소드가 실행됨. 
		
		logText = "====="+pjp.getSignature().getName()+" 실행 후=====";//여기서 signature은 뭔가...
		System.out.println(logText);
		return obj;//왜 리턴하는지는 모르지만 가동하는 것 내에서. 
	}
	
}
