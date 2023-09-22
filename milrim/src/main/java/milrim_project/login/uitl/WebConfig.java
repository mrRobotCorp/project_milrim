package milrim_project.login.uitl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer{

	
	// ResponseEntity<객체>를 리턴할 때, json데이터로 변경처리
	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		//converters.add(new MappingJackson2HttpMessageConverter());
        // 기본 Jackson 컨버터를 가져옵니다.
        MappingJackson2HttpMessageConverter jacksonConverter = new MappingJackson2HttpMessageConverter();
        
        // 컨버터의 설정을 변경하거나 추가할 수 있습니다.
        // 예시: 날짜 형식을 변경하여 JSON으로 출력
        ObjectMapper objectMapper = jacksonConverter.getObjectMapper();
        objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        
        // 컨버터를 리스트에 추가합니다.
        converters.add(jacksonConverter);
	}

	
	
	
}
