package app;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.mockito.Matchers.any;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(MockitoJUnitRunner.class)
public class ApplicationControllerTest {

    private MockMvc mockMvc;
    private ApplicationController subject;
    private ObjectMapper objectMapper;

    @Mock private ApplicationService mockApplicationService;

    @Before
    public void setUp() throws Exception {
        subject = new ApplicationController(this.mockApplicationService);
        mockMvc = MockMvcBuilders.standaloneSetup(subject).build();
        objectMapper = new ObjectMapper();
    }

    @Test
    public void postUsers() throws Exception {
        User user = User.builder()
            .username("maaya")
            .password("epona")
            .build();

        mockMvc.perform(post("/users")
            .contentType(MediaType.APPLICATION_JSON)
            .content(objectMapper.writeValueAsString(user)))
            .andExpect(status().isCreated());

        verify(mockApplicationService).createUser(any(User.class));
    }
}
