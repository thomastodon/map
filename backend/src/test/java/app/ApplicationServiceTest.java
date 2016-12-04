package app;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class ApplicationServiceTest {

    private ApplicationService subject;
    @Mock private BCryptPasswordEncoder mockEncoder;
    @Mock private UserRepository mockUserRepository;

    @Before
    public void setUp() throws Exception {
        subject = new ApplicationService(mockUserRepository, mockEncoder);
    }

    @Test
    public void createUser() {
        User user = User.builder().username("maaya").password("epona").build();
        String hash = "$2a$10$trT3.R/Nfey62eczbKEnueTcIbJXW.u1ffAo/XfyLpofwNDbEB86O";
        when(mockEncoder.encode(user.getPassword())).thenReturn(hash);

        subject.createUser(user);

        verify(mockEncoder).encode("epona");
        verify(mockUserRepository).save(user);
    }
}