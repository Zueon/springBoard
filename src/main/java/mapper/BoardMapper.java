package mapper;

import domain.BoardVO;
import domain.Criteria;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BoardMapper {
//    @Select("select * from tbl_board where bno > 0")
    public List<BoardVO> getListWithPaging(Criteria criteria);

    public List<BoardVO> getList();

    public void insert(BoardVO board);
    public void insertSelectKey(BoardVO board);

    public BoardVO read(Long bno);

    public int delete(Long bno);

    public int update(BoardVO board);

    public int getTotalCnt(Criteria criteria);
}