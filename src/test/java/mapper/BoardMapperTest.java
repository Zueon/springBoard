package mapper;

import config.RootConfig;
import domain.BoardVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
@Log4j2
public class BoardMapperTest {

    @Setter(onMethod_ = @Autowired)
    private BoardMapper mapper;

    @Test
    public void testGetList(){
        mapper.getList().forEach(board -> log.info(board));
    }
    @Test
    public void insertTest(){
        BoardVO board = new BoardVO();
        board.setTitle("new title");
        board.setContent("new Content");
        board.setWriter("new Writer");

        mapper.insert(board);

        log.info(board);
    }

    @Test
    public void insertSelectKeyTest(){
        BoardVO board = new BoardVO();
        board.setTitle("new title");
        board.setContent("new Content");
        board.setWriter("new Writer");

        mapper.insertSelectKey(board);

        log.info(board);
    }

    @Test
    public void readTest(){
        BoardVO board = mapper.read(5L);
        log.info(board);
    }

    @Test
    public void deleteTest(){
        log.info("deleted : " + mapper.delete(3L));
    }

    @Test
    public void updateTest() {
        BoardVO board = new BoardVO();
        board.setBno(1L);
        board.setTitle("수정된 제목");
        board.setContent("수정된 내용");
        board.setWriter("user00");
        int count = mapper.update(board);
        log.info("UPDATE COUNT: " + count);
    }
}