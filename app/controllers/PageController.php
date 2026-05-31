<?php
class PageController extends Controller
{
    public function baoHanh(): void { $this->render('pages.bao_hanh', ['title' => 'Chính sách bảo hành']); }
    public function doiTra(): void  { $this->render('pages.doi_tra',  ['title' => 'Đổi trả & Hoàn tiền']); }
    public function huongDan(): void{ $this->render('pages.huong_dan',['title' => 'Hướng dẫn mua hàng']); }
    public function thanhToan(): void{ $this->render('pages.thanh_toan',['title' => 'Phương thức thanh toán']); }
    public function faq(): void     { $this->render('pages.faq',      ['title' => 'Câu hỏi thường gặp']); }
    public function theoDoi(): void
    {
        $ma    = trim($this->input('ma', ''));
        $order = $ma ? Database::fetchOne("SELECT * FROM don_hang WHERE ma_don = ?", [$ma]) : null;
        $this->render('pages.theo_doi', ['title' => 'Theo dõi đơn hàng', 'order' => $order, 'ma' => $ma]);
    }
}
