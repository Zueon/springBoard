package controller;

import domain.BoardVO;
import domain.Criteria;
import domain.PageDTO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.BoardService;

@Log4j2
@RequestMapping("/board/*")
@AllArgsConstructor
@Controller
public class BoardController {
    private BoardService service;

//    @GetMapping("/list")
//    public void list(Model model) {
//        log.info("list");
//        model.addAttribute("list", service.getList());
//    }

    @GetMapping("/list")
    public void list(Criteria criteria, Model model){
        log.info("list:  " + criteria);
        model.addAttribute("list", service.getList(criteria));
//        model.addAttribute("pageMarker", new PageDTO(criteria, 123));
        int total = service.getTotalCnt(criteria);
        model.addAttribute("pageMarker", new PageDTO(criteria, total));
    }

    @GetMapping("/register")
    public void register() {

    }

    @PostMapping("/register")
    public String register(BoardVO board, RedirectAttributes rttr) {

        log.info("-----------------REGISTER-----------------");
        log.info(board.getTitle());
        service.register(board);
        rttr.addFlashAttribute("result", board.getBno());
        return "redirect:/board/list";
    }

    @GetMapping({"/get", "/modify"})
    public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("criteria") Criteria criteria) {

        // @ModelAttribute : 자동으로 Model에 데이터를 지정한 이름으로 저장한다.
        // 없어도 컨트롤러에서 화면으로 파라미터가 된 객체는 전달이 되지만 명시적으로 이름을 지정하기 위해 사용
        log.info("-----------------GET or MODIFY-----------------");
        model.addAttribute("board", service.get(bno));
    }

    @PostMapping("/modify")
    public String modify(BoardVO board, RedirectAttributes rttr, @ModelAttribute("criteria") Criteria criteria) {
        log.info("-----------------MODIFY-----------------");
        if (service.modify(board)) {
            rttr.addFlashAttribute("result", "SUCCESS");
        }
        rttr.addAttribute("pageNum", criteria.getPageNum());
        rttr.addAttribute("amount", criteria.getAmount());
        return "redirect:/board/list";

    }

    @PostMapping("/remove")
    public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr,@ModelAttribute("criteria") Criteria criteria) {
        log.info("remove... :" + bno);
        if (service.remove(bno)) {
            rttr.addFlashAttribute("result", "success");
        }
        rttr.addAttribute("pageNum", criteria.getPageNum());
        rttr.addAttribute("amount", criteria.getAmount());
        return "redirect:/board/list";

    }
}
