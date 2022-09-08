package service;

import domain.BoardVO;
import domain.Criteria;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
public class BoardServiceImpl implements BoardService{

    @Setter(onMethod_ = @Autowired)
    private BoardMapper mapper;

    @Override
    public void register(BoardVO board) {
        log.info("REGISTER--------" + board);
        mapper.insertSelectKey(board);

    }

    @Override
    public BoardVO get(Long bno) {
        log.info("get--------------" + bno);
        return mapper.read(bno);
    }

    @Override
    public boolean modify(BoardVO board) {

        log.info("modify --------------" + board);
        return mapper.update(board) == 1;
    }

    @Override
    public boolean remove(Long bno) {
        log.info("remove ---------------" + bno);
        return mapper.delete(bno) == 1;
    }

    @Override
    public List<BoardVO> getList(Criteria cri){
        log.info("getList with criteria--------------- " + cri );
        return mapper.getListWithPaging(cri);
    }
}