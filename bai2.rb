class Thuvien
    def initialize
    end
    $phuongtien= []
    def nhap_thuvien
        print "Mã tài liệu: "
        @matailieu =gets.chomp
        print "Tên xuất bản: "
        @tenxuatban= gets.chomp
        print "Số bản phát hành: "
        @sobanphathanh=gets.chomp

    end
    def hienthi
        puts "Mã tài liẹu: #{@matailieu},Tên xuất bản: #{@tenxuatban},Số bản phát hành: #{@sobanphathanh}"
    end 
    attr_accessor :matailieu, :tenxuatban, :sobanphathanh
end
class Sach < Thuvien
    def initialize
    end
    attr_accessor :tentacgia, :sotrang
    def nhap_thuvien
        super
        print "Tên tác giả: "
        @tentacgia=gets.chomp
        print "Số trang: "
        @sotrang=gets.to_i
    end
    def hienthi
        super
        puts "Loại tài liệu: Sách, Tên tác giả: #{@tentacgia}, Số trang: #{@sotrang}"
    end
   
end
class Tapchi < Thuvien
    def initialize
    end
    def nhap_thuvien
        super
        print "Số phát hành: "
        @sophathanh=gets.chomp
        print "Tháng phát hành: "
        @thangphathanh=gets.chomp
    end
    def hienthi
        super
        puts "Loại tài liệu: Tạp chí, Số phát hành: #{@sophathanh}, Tháng phát hành: #{@thangphathanh}"
    end
    attr_accessor :sophathanh, :thangphathanh
end
class Bao < Thuvien
    def initialize
    end
    def nhap_thuvien
        super
        print "Ngày phát hành: "
        @ngayphathanh=gets.chomp
    end
    def hienthi
        super
        puts "Loại tài liệu: Báo, Ngày phát hành: #{@ngayphathanh}"
    end
    attr_accessor :ngayphathanh
end
class QuanLySach
    def initialize
    end
    $thuviens=[]
    def themtailieu
        puts "1. Thêm sách"
        puts "2. Thêm tạp chí"
        puts "3. Thêm báo"
        chon=gets.to_i
        if chon==1
            thuvien=Sach.new
            elsif chon==2
          thuvien=Tapchi.new
                elsif chon==3
          thuvien=Bao.new
                end
      thuvien.nhap_thuvien
                $thuviens << thuvien
    end
    def hienthitailieu
        $thuviens.each do |thuvien|
            puts thuvien.hienthi
        end
    end
    def xoatailieu
        print "Nhập id phương tiện muốn xóa: "
        xoa= gets.chomp
        $thuviens.each do |thuvien|
            if thuvien.matailieu==xoa
                $thuviens.delete(thuvien)
            end
        end
    end
    def timkiem
        ketqua=[]
        print "Nhập cụm từ tìm kiếm: "
        timkiem= gets.chomp
        $thuviens.each do |thuvien|
            if thuvien.matailieu==timkiem
                ketqua << thuvien
                elsif thuvien.tenxuatban==timkiem
                    ketqua << thuvien
                    elsif thuvien.sobanphathanh==timkiem
                        ketqua << thuvien
                    end
        puts "Kết quả tìm kiếm: "
        ketqua.each do |thuvien|
            puts thuvien.hienthi
        end
    end
end
end
$count =true
while $count
    quanly= QuanLySach.new
    puts"1. Thêm tài liệu: "
    puts"2. Xóa tài liệu : "
    puts"3. Hiển thị danh sách tài liệu: "
    puts"4. Tìm kiếm: "
    puts"5. Thoát!"
    puts"Mời bạn chọn! "
    chon2=gets.to_i
    case chon2
    when 1 
        quanly.themtailieu
    when 2
        quanly.xoatailieu
    when 3
        quanly.hienthitailieu
    when 4
        quanly.timkiem
    when 5
        puts "Chào bạn!"
        $count=false
    end
end
