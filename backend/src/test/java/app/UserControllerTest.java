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
public class UserControllerTest {

    private MockMvc mockMvc;
    private UserController subject;
    private ObjectMapper objectMapper;

    @Mock private UserService mockUserService;

    @Before
    public void setUp() throws Exception {
        subject = new UserController(this.mockUserService);
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

        verify(mockUserService).createUser(any(User.class));
    }
}
